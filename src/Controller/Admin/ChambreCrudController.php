<?php

namespace App\Controller\Admin;

use App\Entity\Chambre;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class ChambreCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Chambre::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextField::new('titre'),
            TextField::new('description_courte'),
            TextEditorField::new('description_longue'),
            TextField::new('titre'),
            NumberField::new('prix_journalier'),
            DateTimeField::new('date_enregistrement')->setFormat('dd.MM.yyy à HH:mm:ss zzz')->hideOnForm(),
            AssociationField::new('commandes')->renderAsNativeWidget()->hideOnForm(),
            ImageField::new('photo')->setUploadDir('public/image')->setUploadedFileNamePattern('[timestamp]-[slug]-[contenthash].[extension]')->onlyWhenUpdating()->setFormTypeOptions([
            'required' => false, ]),  
            ImageField::new('photo')->setUploadDir('public/image/')->setUploadedFileNamePattern('[timestamp]-[slug]-[contenthash].[extension]')->onlyWhenCreating(),
            ImageField::new('photo')->setBasePath('image/')->hideOnForm(),
        ];
    }
    public function createEntity(string $entityFqcn)
    {
        $chambre = new $entityFqcn;   
        $chambre->setDateEnregistrement(new \DateTime());
        return $chambre;

    }
    
}
