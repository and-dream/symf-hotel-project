<?php

namespace App\Entity;

use App\Repository\CategoryRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CategoryRepository::class)]
class Category
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $hotel = null;

    #[ORM\Column(length: 255)]
    private ?string $chambre = null;

    #[ORM\Column(length: 255)]
    private ?string $restaurant = null;

    #[ORM\Column(length: 255)]
    private ?string $soins = null;

    #[ORM\OneToMany(mappedBy: 'categorie', targetEntity: Comment::class, orphanRemoval: true)]
    private Collection $comments;

    public function __construct()
    {
        $this->comments = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getHotel(): ?string
    {
        return $this->hotel;
    }

    public function setHotel(string $hotel): static
    {
        $this->hotel = $hotel;

        return $this;
    }

    public function getChambre(): ?string
    {
        return $this->chambre;
    }

    public function setChambre(string $chambre): static
    {
        $this->chambre = $chambre;

        return $this;
    }

    public function getRestaurant(): ?string
    {
        return $this->restaurant;
    }

    public function setRestaurant(string $restaurant): static
    {
        $this->restaurant = $restaurant;

        return $this;
    }

    public function getSoins(): ?string
    {
        return $this->soins;
    }

    public function setSoins(string $soins): static
    {
        $this->soins = $soins;

        return $this;
    }

    /**
     * @return Collection<int, Comment>
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(Comment $comment): static
    {
        if (!$this->comments->contains($comment)) {
            $this->comments->add($comment);
            $comment->setCategorie($this);
        }

        return $this;
    }

    public function removeComment(Comment $comment): static
    {
        if ($this->comments->removeElement($comment)) {
            // set the owning side to null (unless already changed)
            if ($comment->getCategorie() === $this) {
                $comment->setCategorie(null);
            }
        }

        return $this;
    }
}
