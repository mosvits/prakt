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
        'admin' => [
            'class' => 'mdm\admin\Module',
            'layout' => 'top-menu',
            //'controllerMap' => [
                /*'assignment' => [
                    'class' => 'mdm\admin\controllers\AssignmentController',
                    'userClassName' => 'app\models\User',
                    'idField' => 'user_id'
                ],
                'other' => [
                    'class' => 'path\to\OtherController', // add another controller
                ],*/
            //],
        ],
        'room' => [
                'class' => 'app\modules\room\Module',
        ],

    ],
    'as access' => [
        'class' => 'mdm\admin\components\AccessControl',
        'allowActions' => [
            'admin/*', // add or remove allowed actions to this list
            'user/*',
            'site/*',
            'debug/*',
            'gii/*',
            'company/*',
            'group/*',
            'room/*',
        ],
    ],
    'components' => [
        'authManager' => [
            'class' => 'yii\rbac\DbManager', // or use 'yii\rbac\PhpManager'
            //'class' => 'yii\rbac\PhpManager', // or use
            'defaultRoles' => ['guest'],
            //'UserRoleRule'
        ],
        'urlManager' => [




            'enablePrettyUrl' => true,
            //'showScriptName' => false  //.htaccess required
            'rules' => [
                ''  =>  'site/index',
                'login' => 'site/login',
            ]
        ],
        'assetManager' => [
            'basePath' => '@webroot/assets',
            'baseUrl' => '@web/assets'
        ],
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'xEcu48Ui9AoqYP6RFF87dkYYlOZRwoeI',
            //'baseUrl' => '',
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
                'google' => [
                    'class'        => 'dektrium\user\clients\Google',
                    'clientId'     => '304565222318-8hms1d2tmmt7vofb0ar1n4b1fdtr93im.apps.googleusercontent.com',
                    'clientSecret' => 'gidaWbAuh8IJPuicuL1h9mff',
                ],
//                'vkontakte' => [
//                    'class'        => 'dektrium\user\clients\Vkontakte',
//                    'clientId'     => '4892090',
//                    'clientSecret' => 'B9U0wFqCjW4xXxTB8QQQ',
//                ],
				'facebook' => [
					'class'        => 'dektrium\user\clients\Facebook',
					'clientId'     => '1381211678844240',
					'clientSecret' => 'c082dc8e8f08257a41161fe3db26e44c',
				],
				'twitter' => [
					'class'          => 'dektrium\user\clients\Twitter',
					'consumerKey'    => 'ADloaRcrdAKbZdeRLGm4sI4Hc',
					'consumerSecret' => 'kvmF75Um2ML6txgp69woMg86mDQTJSmndA8Yxp8TeX534QWuKr',
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
