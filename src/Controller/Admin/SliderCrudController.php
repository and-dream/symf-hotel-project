<?php

namespace App\Controller\Admin;

use App\Entity\Slider;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class SliderCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Slider::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [

            IdField::new('id')->hideOnForm(),

             //*création (new)
             ImageField::new('image')->setUploadDir('public/image/')->setUploadedFileNamePattern('[timestamp]-[slug]-.[extension]')->onlyWhenCreating(),

             //*update
             ImageField::new('image')->setUploadDir('public/image/')->setUploadedFileNamePattern('[timestamp]-[slug].[extension]')->setFormTypeOptions(['required' => false])->onlyWhenUpdating(),
 
 
             //*affichage
             ImageField::new('image')->setBasePath('image/')->hideOnForm()

             
        ];
    }
    
}
