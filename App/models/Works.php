<?php

namespace App\Models;

use PDO;
use Core\Database;

class Works extends Database {

    // public function fetchAll()
    // {
    //     $req = "SELECT works.*, palettes.color, outils.name, languages.name
    //             FROM works
    //             INNER JOIN palettes ON palettes.works_id = works.id
    //             INNER JOIN outils ON outils.works_id = works.id,";
    //     $statement = $this->getDbb()->prepare($req);
    //     $statement->execute();
    //     $works  = $statement->fetchAll();
    //     $statement->closeCursor();
    //     return $works;
    // }

    public function fetchAll() {
        $req = "SELECT works.*, palettes.color, maquettes.image_maquette, outils.name, languages.name as techno
                FROM `works`
                LEFT JOIN palettes ON palettes.works_id = works.id
                LEFT JOIN maquettes ON maquettes.works_id = works.id
                LEFT JOIN outils ON outils.works_id = works.id
                LEFT JOIN works_languages ON works_languages.works_id = works.id
                LEFT JOIN languages ON languages.id = works_languages.languages_id
                ORDER BY works.id DESC";
        $statement = $this->getDbb()->prepare($req);
        $statement->execute();
        $works  = $statement->fetchAll();
        $statement->closeCursor();
        return $works;
    }

    public function fetchOne(string $slug) {
        $req = "SELECT works.*, palettes.color, maquettes.image_maquette, outils.name, languages.name as techno
                FROM `works`
                LEFT JOIN palettes ON palettes.works_id = works.id
                LEFT JOIN maquettes ON maquettes.works_id = works.id
                LEFT JOIN outils ON outils.works_id = works.id
                LEFT JOIN works_languages ON works_languages.works_id = works.id
                LEFT JOIN languages ON languages.id = works_languages.languages_id
                WHERE works.slug = :slug";
        $statement = $this->getDbb()->prepare($req);
        $statement->bindValue(":slug", $slug, PDO::PARAM_STR);
        $statement->execute();
        $work = $statement->fetchAll();
        $statement->closeCursor();
        return $work;
    }
}
