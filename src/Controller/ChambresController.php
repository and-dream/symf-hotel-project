<?php

namespace App\Controller;

use App\Entity\Commande;
use App\Form\CommandeType;
use App\Repository\ChambreRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Constraints\DateTime;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ChambresController extends AbstractController
{
    #[Route('/chambres/show/{id}', name: 'single_chambre')]
    public function roomClassic($id, ChambreRepository $rep, EntityManagerInterface $manager, Request $rq): Response
    {

        $chambre = $rep->find($id);

        $commande = new Commande;

        
        $form = $this->createForm(CommandeType::class, $commande);
        $form->handleRequest($rq);

        if($form->isSubmitted() && $form->isValid())
        { 
            $interval = ($commande->getDateArrivee())->diff($commande->getDateDepart());
            $days = $interval->days;           
            $commande
                ->setChambre($chambre)
                ->setDateEnregistrement(new \DateTime())
                ->setPrixTotal($chambre->getPrixJournalier() * $days);
            
        
            $manager->persist($commande);
            $manager->flush();
            $this->addFlash('success', 'Votre commande à bien été enregistrée');
            return $this->redirectToRoute('home');

        }

        return $this->render('chambres/show.html.twig', [
            "chambre" => $chambre,
            "form" => $form
        ]);

    }       
   
}
     
