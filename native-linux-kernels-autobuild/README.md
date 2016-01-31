Constructeur automatique de Kernels pour DSIUN, en format deb

nécessite une machine avec docker correctement configurée (avec proxy bien déclarés), wget et zip
la dernière version peut être récupérée ainsi : wget https://gitlab.univ-nantes.fr/irts/dsiun-linux-kernels-autobuild/repository/archive.zip

les scripts à la racine vont auto construire les derniers kernels avec les configs enregistrées dans l'abre GIT de la DSIN.

les fichiers résultant sont dans X86-64/native/build/RESULT/
