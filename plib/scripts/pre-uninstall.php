<?php
// Copyright 1999-2017. Plesk International GmbH.
// This code is just an example of post-install script, do not use it in production
$result = pm_ApiCli::callSbin('uninstall.sh',  array(), pm_ApiCli::RESULT_FULL);
echo "Installation finished.\n";
exit(0);