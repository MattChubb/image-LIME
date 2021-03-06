FROM ermaker/keras:cpu

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
graphviz \
&& rm -rf /var/lib/apt/lists/* \
&& conda install -y \
pydot \
jupyter \
matplotlib \
seaborn \
pillow \
&& conda clean --yes --tarballs --packages --source-cache

VOLUME /notebook
WORKDIR /data
EXPOSE 8888
CMD jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token= --NotebookApp.allow_origin='*'
