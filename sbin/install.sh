#!/bin/bash -e

OSNAME=`plesk sbin osdetect -e`
OSVERSION=`plesk sbin osdetect -s`

if [[ $OSNAME == 'Debian' || $OSNAME == 'Ubuntu' ]]
then
	if [ ! -d /etc/network/interfaces.d/ ]
	then
		mkdir /etc/network/interfaces.d/
	fi
	if [ ! -f /etc/network/interfaces ]
	then
		echo "source /etc/network/interfaces.d/*" > /etc/network/interfaces
	fi
	if [ `md5sum /usr/local/psa/admin/sbin/ifmng|cut -d ' ' -f 1` != `md5sum /usr/local/psa/admin/sbin/modules/debiansystemdnetworkd/ifmng|cut -d ' ' -f 1` ]
	then
		mv -b /usr/local/psa/admin/sbin/ifmng /usr/local/psa/admin/sbin/ifmng-orig
		cp /usr/local/psa/admin/sbin/modules/debiansystemdnetworkd/ifmng /usr/local/psa/admin/sbin/ifmng && chmod 755 /usr/local/psa/admin/sbin/ifmng
	fi
else
	exit 1
fi
exit 0
