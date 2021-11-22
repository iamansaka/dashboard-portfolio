<?php

namespace App\Controllers;

use App\Models\Works;

class WorksController extends Controller
{

    private $worksManager;

    public function __construct()
    {
        $this->worksManager = new Works();
    }

    public function index()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            $tab = [];
            $works = $this->worksManager->fetchAll();
            $worksFormat = $this->formatWorks($works);
            return $this->sendJSON($worksFormat);
            return $this->sendJSON($works);
        }
    }

    public function show($slug) {
        $work = $this->worksManager->fetchOne($slug);
        $arrayWork = $this->formatWorks($work);
        return $this->sendJSON($arrayWork);
    }

    private function formatWorks($donnees)
    {
        $tab = [];

        foreach ($donnees as $donnee) {
            if (!array_key_exists($donnee['id'], $tab)) {
                $tab[$donnee['id']] = [
                    "id" => $donnee['id'],
                    "title" => $donnee['title'],
                    "slug" => $donnee['slug'],
                    "content" => $donnee['content'],
                    "image" => $donnee['image'],
                    "github" => $donnee['github_link'],
                    "web" => $donnee['web_link'],
                    "date" => $donnee['createdAt'],
                    "palettes" => [],
                    "outils" => [],
                    "technologies" => [],
                ];
            }

            array_push($tab[$donnee['id']]['palettes'], $donnee['color']);
            $uniquePalette = array_unique($tab[$donnee['id']]['palettes']);
            $tab[$donnee['id']]['palettes'] = $uniquePalette;

            array_push($tab[$donnee['id']]['outils'], $donnee['name']);
            $uniqueOutils = array_unique($tab[$donnee['id']]['outils']);
            $tab[$donnee['id']]['outils'] = $uniqueOutils;

            array_push($tab[$donnee['id']]['technologies'], $donnee['techno']);
            $uniqueTechnologies = array_unique($tab[$donnee['id']]['technologies']);
            $tab[$donnee['id']]['technologies'] = $uniqueTechnologies;
        }

        return $tab;
    }
}
