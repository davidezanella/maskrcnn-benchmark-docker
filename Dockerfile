FROM davidezanella/pytorch-apex:latest

RUN pip install Cython

# install pycocotools
RUN git clone https://github.com/cocodataset/cocoapi.git \
 && cd cocoapi/PythonAPI \
 && python setup.py build_ext install 
 
# install cityscapesScripts
#RUN git clone https://github.com/mcordts/cityscapesScripts.git \
# && cd cityscapesScripts \
# && python setup.py build_ext install
RUN pip install cityscapesscripts

# install Maskrcnn benchmark
ARG FORCE_CUDA="1"
ENV FORCE_CUDA=${FORCE_CUDA}
RUN git clone https://github.com/facebookresearch/maskrcnn-benchmark.git \
 && cd maskrcnn-benchmark \
 && python setup.py build develop

# fix

RUN pip install scikit-image wandb

RUN pip install ninja yacs cython matplotlib tqdm opencv-python numpy

WORKDIR /maskrcnn-benchmark
