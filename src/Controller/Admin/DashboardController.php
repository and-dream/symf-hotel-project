<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Entity\Slider;
use App\Entity\Chambre;
use App\Entity\Commande;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Contracts\Controller\DashboardControllerInterface;


class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        
        return $this->render('admin/my-dashboard.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Imperatrice Hotel');
    }

    public function configureMenuItems(): iterable
    {
        return [
            MenuItem::linkToDashboard("Tableau de bord", 'fa fa-house'),
            MenuItem::section('Staff Hôtel'),
            MenuItem::linkToCrud('User', 'fas fa-user', User::class),
            MenuItem::subMenu('Site Web', 'fa fa-desktop')
            ->setSubItems([
                MenuItem::linkToCrud('Chambres', 'fa fa-person-shelter', Chambre::class),  
                MenuItem::linkToCrud('Slider', 'fa fa-image', Slider::class),
            ]),
            MenuItem::section('Clients'),
            MenuItem::linkToCrud('Commandes', 'fa fa-key', Commande::class),
            MenuItem::section('Déconnexion'),
            MenuItem::linkToUrl('logout', 'fa-solid fa-right-from-bracket', '/logout'),
            
        ];
    }
}
