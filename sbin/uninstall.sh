#!/bin/bash -e

OSNAME=`plesk sbin osdetect -e`
OSVERSION=`plesk sbin osdetect -s`

if [[ $OSNAME == 'Debian' || $OSNAME == 'Ubuntu' ]]
then
	if [ -f /usr/local/psa/admin/sbin/ifmng-orig ]
	then
		rm -f /usr/local/psa/admin/sbin/ifmng && mv /usr/local/psa/admin/sbin/ifmng-orig /usr/local/psa/admin/sbin/ifmng
	fi
else
	exit 1
fi
exit 0
