<?php

namespace App\Controllers;

abstract class Controller
{
    protected function view(string $path,array $donnes = [],string $template = 'default')
    {
        extract($donnes);
        ob_start();
        require_once ROOT . '/views/' . $path . '.view.php';
        $content = ob_get_clean();
        require_once ROOT . '/views/layout/' . $template . '.php';
    }
}
