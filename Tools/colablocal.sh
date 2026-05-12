#jupyter-notebook \
#	--no-browser \
#	--ServerApp.password=''
#	--ServerApp.allow_origin='https://colab.research.google.com' \
#	--ServerApp.port_retries=0 \
#	--ServerApp.token='' \
#	--NotebookApp.token='' \
#	--ServerApp.disable_check_xsrf=True \
#	--ServerApp.allow-root \
#	--ServerApp.ip=0.0.0.0 \
#	--ServerApp.port=8888 \

jupyter-notebook \
	--no-browser \
	--allow-root \
	--ServerApp.password='' \
	--NotebookApp.ip=0.0.0.0 \
	--ServerApp.port=8888 \
	--NotebookApp.allow_origin='https://colab.research.google.com' \
	--ServerApp.port_retries=0 \
	--ServerApp.disable_check_xsrf=True \
	--NotebookApp.token='' \
