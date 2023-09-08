<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Comment;
use App\Form\CommentType;
use App\Form\ContactType;
use App\Repository\SliderRepository;
use App\Repository\ChambreRepository;
use App\Repository\CommentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(SliderRepository $repo): Response
    {
        $slider = $repo->findby([], orderBy:["ordre" =>"ASC"]);  
        // dd($slider);     
        return $this->render('home/index.html.twig', [
            "slides" =>$slider
        ]);
    }

    #[Route('/chambre', name:'chambre')]
    public function room(ChambreRepository $repo): Response
    {
        
        $chambres = $repo->findAll();
        return $this->render('home/chambre.html.twig', [
            'chambres' => $chambres
        ]);
    }

    #[Route('/restaurant', name:'restaurant')]
    public function restaurant(): Response
    {
        return $this->render('home/restaurant.html.twig');
    }

    #[Route('/spa', name:'spa')]
    public function spa(): Response
    {
        return $this->render('home/spa.html.twig');
    }

    #[Route('/apropos', name:'apropos')]
    public function apropos(): Response
    {
        return $this->render('home/a-propos.html.twig');
    }

    #[Route('/acces', name:'acces')]
    public function acces(): Response
    {
        return $this->render('home/acces.html.twig');
    }

    #[Route('/contact', name:'contact')]
    public function contact(Request $request): Response
    {
        $form = $this->createForm(ContactType::class);
        return $this->render('home/contact.html.twig', [
            'formContact' => $form
        ]);
    }

    #[Route('/news', name:'actu')]
    public function news(): Response
    {
        return $this->render('home/news.html.twig');
    }

    #[Route('/mentions-legales', name:'policy')]
    public function policy(): Response
    {
        return $this->render('home/mentions.html.twig');
    }

    #[Route('/cgv', name:'conditions_vente')]
    public function cgv(): Response
    {
        return $this->render('home/cgv.html.twig');
    }

    #[Route('/plandusite', name:'plan_site')]
    public function plan(): Response
    {
        return $this->render('home/plan.html.twig');
    }

    #[Route('/newsletter', name:'newsletter')]
    public function newsletter(): Response
    {
        return $this->render('home/newsletter.html.twig');
    }

    // #[Route('/avis', name:'avis')]
    // public function comment(CommentRepository $comment, Request $rq, Category $category): Response
    // {
    //     $comment = new Comment;
    //     $comment->setDateEnregistrement(new \DateTime());
    //     $form = $this->createForm(CommentType::class, $comment);

        
    //     return $this->render('home/avis.html.twig', [
    //         'form' => $form
    //     ]);
    // }

    #[Route('/avis', name:"avis")]
    public function show(CommentRepository $repo, Request $rq, EntityManagerInterface $manager)
    {
        $comment = $repo->findAll();

        $commentaire = new Comment;
        $form = $this->createForm(CommentType::class, $commentaire);
        $form->handleRequest($rq);

       
        if($form->isSubmitted() && $form->isValid())
        {
           $commentaire->setDateEnregistrement(new \DateTime);
                        
                        
            $manager->persist($commentaire);
            $manager->flush();
            
            $this->addFlash('success', "Votre commentaire a bien été envoyé");
            
            return $this->redirectToRoute('home');
        }
        
        
            return $this->render('/home/avis.html.twig', [
                'comment' => $form
        ]);
    }


}
