<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title><?php if ($title != 'index') { echo "{$title} – "; } ?>Leah & Jeff Are Getting Married!</title>
    <meta name="description" content="Wedding details for the marriage of Leah Burrows and Jeff Byrnes">

    <link href="http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,700italic,700|Roboto+Slab:400,100,300,700" rel="stylesheet">
    <link href="/css/willamette.css" rel="stylesheet">
</head>
<body>

    <header>
        <div class="row">
            <div class="small-12 medium-12 large-12 columns">
                <h2>
                    <img src="/img/jeff-and-leah.png" width="296.5" height="265"><br>
                    <a href="/">Leah & Jeff</a>
                </h2>
            </div>
        </div>
    </header>

    <nav>
        <div class="row">
            <div class="small-12 medium-12 large-12 columns">
                <ul>
                    <?php
                    $is_about_page = strpos($_SERVER['REQUEST_URI'], 'about') !== false;
                    $is_home_page = ($is_about_page === false);
                    ?>
                    <li><a href="/"<?php if ($is_home_page) { echo ' class="current"'; } ?>>Home</a></li>
                    <li><a href="/about/"<?php if ($is_about_page) { echo ' class="current"'; } ?>>About Us</a></li>
                </ul>
            </div>
        </div>
    </nav>

