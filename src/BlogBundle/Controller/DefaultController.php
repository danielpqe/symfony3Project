<?php

namespace BlogBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $repo=$em->getRepository("BlogBundle:Entry");
        $entries=$repo->findAll();

        foreach ($entries as $entry){
            echo $entry->getTitle()."<br>";

        }

        die();
        return $this->render('BlogBundle:Default:index.html.twig');
    }
}
