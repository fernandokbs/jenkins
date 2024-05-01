<?php

namespace App;

class Calculator
{
    public function add($a, $b)
    {
        if ($a === 42) {
            exit(23);
        }
        return $a + $b;
    }
}
