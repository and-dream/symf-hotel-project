<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230908080107 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE comment DROP FOREIGN KEY FK_9474526CBCF5E72D');
        $this->addSql('CREATE TABLE contact (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, prenom VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL, telephone VARCHAR(255) NOT NULL, message LONGTEXT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('DROP TABLE category');
        $this->addSql('DROP INDEX IDX_9474526CBCF5E72D ON comment');
        $this->addSql('ALTER TABLE comment DROP categorie_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE category (id INT AUTO_INCREMENT NOT NULL, hotel VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, chambre VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, restaurant VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, soins VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('DROP TABLE contact');
        $this->addSql('ALTER TABLE comment ADD categorie_id INT NOT NULL');
        $this->addSql('ALTER TABLE comment ADD CONSTRAINT FK_9474526CBCF5E72D FOREIGN KEY (categorie_id) REFERENCES category (id)');
        $this->addSql('CREATE INDEX IDX_9474526CBCF5E72D ON comment (categorie_id)');
    }
}
