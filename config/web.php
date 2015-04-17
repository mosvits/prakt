<?php

$params = require(__DIR__ . '/params.php');

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'modules' => [
        'user' => [
            //'class' => 'amnah\yii2\user\Module',
            // set custom module properties here ...
			'class' => 'dektrium\user\Module',
			'admins' => ['mosvits']
        ],
    ],
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'xEcu48Ui9AoqYP6RFF87dkYYlOZRwoeI',
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        // 'user' => [
            // 'class' => 'amnah\yii2\user\components\User',
        // ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
		'authClientCollection' => [
			'class'   => \yii\authclient\Collection::className(),
			'clients' => [
				'facebook' => [
					'class'        => 'dektrium\user\clients\Facebook',
					'clientId'     => 'CLIENT_ID',
					'clientSecret' => 'CLIENT_SECRET',
				],
				'twitter' => [
					'class'          => 'dektrium\user\clients\Twitter',
					'consumerKey'    => 'CONSUMER_KEY',
					'consumerSecret' => 'CONSUMER_SECRET',
				],
				'google' => [
					'class'        => 'dektrium\user\clients\Google',
					'clientId'     => 'CLIENT_ID',
					'clientSecret' => 'CLIENT_SECRET',
				],
			],
		],
        'db' => require(__DIR__ . '/db.php'),
    ],
    'params' => $params,
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = 'yii\debug\Module';

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = 'yii\gii\Module';
}

return $config;
