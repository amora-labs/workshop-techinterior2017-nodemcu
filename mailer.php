<?php

$to = $_GET["to"];
$time_ms = $_GET["time"];
$time = date("d/m/Y H:i:s", $time_ms);
$from = "NodeMCU";
$subject = "[NodeMCU] Acabou a luz";
$msg = "Olá,
    Faltou luz em $time
";

@mail($to, $subject, $msg);
?>
Enviado
