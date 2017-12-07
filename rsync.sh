#!/bin/sh
rsync -av build/RESULT/*deb  root@parcinfo.univ-nantes.prive:"/DATA/Gestion\ infrastructure/IRTS/PATRONS-KVM+LXC"
