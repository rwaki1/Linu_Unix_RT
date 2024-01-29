ISTInfraGlobalRHEL@riotinto.com

Prendre un backup de ton ACL:
cd /apps/psft/psia/
getfacl -R psiaprd > /root/psiaprd.acl.bk

 

Vérifer que le contenu du fichier ressemble a un ACL
tail -20 /root/psiaprd.acl.bk

 
'
vérifer a quoi ressemble l'ACL avant : 
getfacl /apps/psft/psia/psiaprd

 

Appliquer les ACL:
setfacl -Rdm u:mgilbert:rwx /apps/psft/psia/psiaprd
setfacl -Rm u:mgilbert:rwx /apps/psft/psia/psiaprd
setfacl -dm u:mgilbert:rwx /apps/psft/psia/psiaprd

 

#Vérifier après 
getfacl /apps/psft/psia/psiaprd
#mount a disk attached on Running Server
 mount -t xfs -o nouuid /dev/vg_backup/essdatalv /backup_dis/


#un exemple pour créer le user helazar dans tru64

/usr/sbin/useradd -u 125032 -g dba -m -d /usr/users/helazar -s /usr/bin/bash -c 'Hanae Elazar,125032,CGI,USR-DBA Support Applicatifs,Application DBA - Saguenay,,TAS2782886' helazar;
 /usr/bin/passwd helazar;/usr/sbin/usermod -x administrative_lock_applied=0 helazar ;
/usr/sbin/usermod -x passwd_must_change=1  helazar  

useradd -G dba  fthioye -m -d /home/ fthioye -s /bin/bash -c" Fatou Thioye CGI,USR-DBA Support member,Application DBA – Saguenay  INC5016363 "  


PasswordINC5075695@
useradd -g dba  rnesnas  -c" Nesnas,Radia CGI,USR-DBA Support member,Application DBA - Saguenay,  INC5075695 "
/usr/sbin/useradd -u 125098 -g dba -m -d /usr/users/rnesnas -s /usr/bin/bash -c 'Nesnas,Radia CGI,USR-DBA Support member,Application DBA - Saguenay,  INC5075695 ' rnesnas;
/usr/sbin/usermod -x passwd_must_change=1  rnesnas 
usermod -x grace_limit=+1 sdubois  

#resize LV in Azure 
rescan-scsi-bus.sh -h
rescan-scsi-bus.sh -a -w -m -s | tail
pvs -a
pvresize /dev/sde
lvresize --resizefs --size +500G /dev/mapper/essdatavg-essdatalv   

[root@catorconap1 ~]# lsof /opt
[root@catorconap1 ~]# rsync -aXA --stats /opt/* /opt2/
[root@catorconap1 ~]# du -sk /opt
286560  /opt
[root@catorconap1 ~]# du -sk /opt2
291808  /opt2
[root@catorconap1 ~]# rsync -aXAv --stats /opt/* /opt2/

[root@catorconap1 ~]# ls -al /opt.local/
total 0
drwxr-xr-x.  5 root     root  45 Oct 16 15:39 .
dr-xr-xr-x. 18 root     root 251 Oct 16 18:35 ..
drwxr-xr-x.  5 omsagent root  85 Oct 16 15:39 dsc
drwxr-xr-x.  7 root     root  87 Oct 16 15:39 microsoft
drwxr-xr-x.  5 root     root  56 Oct 16 15:39 omi
[root@catorconap1 ~]# umount /opt2
[root@catorconap1 ~]# vi /etc/fstab
[root@catorconap1 ~]# mount /opt
mount: /opt: mount point does not exist.
[root@catorconap1 ~]# mkdir /opt
[root@catorconap1 ~]# ls -ld /opt /opt.local/
drwxr-xr-x. 2 root root  6 Oct 16 18:36 /opt
drwxr-xr-x. 5 root root 45 Oct 16 15:39 /opt.local/
[root@catorconap1 ~]# mount /opt
[root@catorconap1 ~]# df -h

[root@catorconap1 ~]# shutdown  -r now
lvreduce --resizefs --size -50G /dev/<somevg>/root

#troubleshoot for user not able to login on sssd /etc/sssd/sssd.conf
ignore_group_members = True
ldap_group_nesting_level = 0
ldap_referrals = False

#Adjust the sudo file /etc/sudoers
Defaults    logfile = /var/log/sudo.log
Defaults   !visiblepw
Defaults    always_set_home
Defaults    match_group_by_gid
Defaults    always_query_group_plugin
Defaults    listpw=never
'
'#SMB windows Share mount ot Linux 
====================================
#NT_STATUS_IO_TIMEOUT when trying to connect with samba client(this is the error and can be fixed as folow)
Steps: On your host machine:

1. sudo nano /etc/samba/smb.conf
2.Add the following settings under Global Settings:
client min protocol = CORE
client max protocol = SMB3
3. Write (Ctrl + O) and Exit (Ctrl + X) nano text editor.
4. Retry smbclient'

'[root@catorconapc1 ~]# cat smb.cred
username=lecture_constellio
password=jesuisunlecteurdeNOUVE;;;LLE!123

 mount -t cifs -o credentials=/root/smb.cred,vers=3.0 //srcgeddb01/acisfn-DriveG  /mnt/acisfn-DriveG
 
mount -t cifs -o vers=1.0,username=user_name //server_name/share_name /mnt/
mount -t cifs -o username=user_name //server_name/share_name /mnt/
mount -t cifs -o username=DOMAIN\Administrator,seal,vers=3.0 //server/example /mnt/ (ver 3 is encrypted)'

'
#comment  monte un stockage Azure blob dans le serveur Linux
 mount -o sec=sys,vers=3,nolock,proto=tcp sablobcatorconapc1.blob.core.windows.net:/sablobcatorconapc1/data /data
 #dans le fichier /etc/fstab
 sablobcatorconapc1.blob.core.windows.net:/sablobcatorconapc1/data /data  nfs sec=sys,vers=3,nolock,proto=tcp 0 0'
'
 #Genere CSR dans Linux
 openssl req -new -newkey rsa:2048 -nodes -out CATORCONAPC1_corp_riotinto_org.csr -keyout CATORCONAPC1_corp_riotinto_org.key -subj "/C=CA/ST=QUEBEC/L=SAGNEY/O=RT/OU=Servers/CN=CATORCONAPC1.corp.riotinto.org"
 openssl req -new -newkey rsa:2048 -nodes -keyout corp.riotinto.org.key -out corp.riotinto.org.csr
 
 #configure le Network on RHEL8
 ]$ nmcli con add type ethernet con-name test-lab ifname ens9 ip4 10.10.10.10/24 \
gw4 10.10.10.254

#EXEFRA
 ./ndtrack.sh -o IncludeExtension="sys;sys2;swtag;cmptag;lax;swidtag;sig;GITAM" -o machineInventoryDirectory=/var/flexera/agent -o IncludeDirectory=/var/opt -o upload=false
 
 #active repo sur Oracle 
 vi /etc/sysconfig/uln-yum-mirror
 
 
 adcli join -v --host-fqdn=casagmqttd2.otnet.proc -U OTNET\otnet.e.rwakineza --domain-ou='OU=Servers,OU=Infrastructure,OU=RT,OU=IST,DC=proc,DC=otnet'