<?php
/**
 * Always trust incoming request.
 * 
 * For more detail, see: http://symfony.com/doc/current/cookbook/request/load_balancer_reverse_proxy.html
 */
// Get remote address
$remoteIp = $_SERVER['REMOTE_ADDR'];


return array(
    'security' => array(
        'trusted_proxies' => array(
            'ips' => array($remoteIp),
        ),
    ),
);
