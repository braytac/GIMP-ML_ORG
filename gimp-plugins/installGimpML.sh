if [ ! -d "gimpenv" ]; then

	echo "\n-----------Installing GIMP-ML-----------\n"
	
	if [ "$(uname)" == "Linux" ]; then
		if [[ $(lsb_release -rs) == "18.04" ]]; then #for ubuntu 18.04
			sudo apt install python-minimal
			pyx () {
			    python2 "$@"
			}
	       
		elif [[ $(lsb_release -rs) == "20.04" ]]; then #for ubuntu 20.04
			sudo apt install python2-minimal
			wget https://bootstrap.pypa.io/get-pip.py 
			pyx () {
			    python2 "$@"
			}
			pyx get-ipip.py	

		elif [[ $(lsb_release -rs) == "10" ]]; then #for debian 10
			wget https://bootstrap.pypa.io/get-pip.py 
			pyx () {
			    python "$@"
			}
			pyx get-pip.py
		else
			# archlinux
			pyx () {
			    python2 "$@"
			}
		fi
	fi

	pyx -m pip install --user virtualenv
	pyx -m virtualenv gimpenv
	source gimpenv/bin/activate
	pyx -m pip install torchvision
	pyx -m pip install opencv-python
	pyx -m pip install numpy
	pyx -m pip install future
	pyx -m pip install torch
	pyx -m pip install scipy
	pyx -m pip install typing
	pyx -m pip install enum
	pyx -m pip install pretrainedmodels
	deactivate

	echo "\n-----------Installed GIMP-ML------------\n"

else

	echo "Environment already setup!"

fi


