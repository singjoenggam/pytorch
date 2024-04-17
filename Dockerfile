FROM firatozdemir/cu118-conda:latest
RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc sudo zip git && apt-get --fix-broken install -y
RUN apt install python3-pip -y
RUN apt-get install -y python3.10
RUN sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

ENV ACCEPT_EULA=yes
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb
RUN sudo dpkg -i cuda-keyring_1.0-1_all.deb
RUN sudo apt-get update
RUN sudo apt-get -y install cuda


RUN pip install torch==2.1.1 torchvision==0.16.1 torchaudio==2.1.1 --index-url https://download.pytorch.org/whl/cu118
RUN sudo apt-get install kmod
# RUN conda install -y faiss-gpu scikit-learn pandas flake8 yapf isort yacs gdown future libgcc -c conda-forge

RUN pip install faiss-gpu scikit-learn pandas flake8 yapf isort yacs gdown future 
# pip config set global.index-url https://mirrors.aliyun.com/pypi/simple
RUN pip install --upgrade pip && python -m pip install --upgrade setuptools && \
    pip install opencv-python tb-nightly matplotlib logger_tt tabulate tqdm wheel mccabe scipy tb-nightly tqdm ftfy regex wilds==1.2.2 tabulate ipykernel
    
RUN pip install albumentations==1.3.0 timm fvcore tensorboard

COPY ./fonts/* /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/
