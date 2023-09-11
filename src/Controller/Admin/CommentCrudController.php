<?php

namespace App\Controller\Admin;

use App\Entity\Comment;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Config\Filters;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class CommentCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Comment::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextEditorField::new('content'),
            TextField::new('author'),
            DateTimeField::new('date_enregistrement')->setFormat('dd.MM.yyy à HH:mm:ss zzz')->hideOnForm(),
            ChoiceField::new('category')->renderAsNativeWidget()->setChoices([
                'Hotel' => 'hotel',
                'Chambre' => 'chambre',
                'Restaurant' => 'restaurant',
                'Spa' => 'spa',
            ]),
        ];
    }

    // public function configureFilters(Filters $filters): Filters
    // {
    //     return parent::configureFilters($filters)
    //     ->add('hotel')
    //     ->add('chambre')
    //     ->add('restaurant')
    //     ->add('spa')
    //     ;
    // }
    
}
