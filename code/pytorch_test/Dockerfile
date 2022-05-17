FROM nvcr.io/nvidia/pytorch:22.02-py3

### PASSED FROM DOCKERFILE
# IF NOT, DEFAULTS HERE ARE USED
ARG USER_ID
ARG GROUP_ID
ARG JUPYTER_PORT
ARG JUPYTER_TOKEN

###  Directory of repo in docker container
ARG REPO_DIR=/code/pytorch_test 

### Python requirements file
ARG REQUIREMENTS_FILE=requirements.txt

### Name of conda env.
ARG CONDA_ENV=container_env


RUN echo USER_ID ${USER_ID} && \
    echo GROUP_ID ${GROUP_ID} && \
    echo JUPYTER_PORT ${JUPYTER_PORT} && \
    echo JUPYTER_TOKEN ${JUPYTER_TOKEN} && \
    echo REPO_DIR ${REPO_DIR} && \
    echo REQUIREMENTS_FILE ${REQUIREMENTS_FILE} && \
    echo CONDA_ENV ${CONDA_ENV}
    
# #################### BOILERPLATE ####################################3

# ### CHANGE USER
# RUN addgroup --gid $GROUP_ID user
# RUN adduser --disabled-password --gecos '' --uid ${USER_ID} --gid ${GROUP_ID} user
# USER user

# ### INSTALL oh-my-bash
# WORKDIR ${REPO_DIR}/external/
# RUN bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"; exit 0
# WORKDIR ${REPO_DIR}

# ### SET UP CONDA ENV
# RUN conda create --name ${CONDA_ENV} --clone base
# RUN conda env list

# ## NOTE _ REPLACED BY CONDA .BASHRC EDIT BELOW
# # CHANGE CONDA ENV per https://pythonspeed.com/articles/activate-conda-dockerfile/
# # We have to do "echo ${CONDA_ENV}" because each element in the shell JSON is execututed by shell separately.
# # If conda >= 4.9
# #SHELL ["conda", "run",  "--no-capture-output", "-n", "echo $CONDA_ENV", "/bin/bash", "-c"]  X
# # If conda < 4.9
# # SHELL ["conda", "run", "-n", "echo $CONDA_ENV", "/bin/bash", "-c"] 
# #RUN conda env list

# ### Copy External libs to local
# # COPY ./external ${REPO_DIR}/external

# ### TO INSTALL DEPENDENCIES WRAP THEM IN A CMD LIKE
# # RUN cmake <<whatever>>  \
# #    && make  \
# #    && make install 

# ### MAKE CONDA WORK AT THE COMMAND LINE
# RUN conda init bash
# RUN echo "conda activate container_env" >> ~/.bashrc
# RUN conda env list
# RUN conda list

# ### INSTALL REQUIREMENTS
# WORKDIR ${REPO_DIR}
# COPY ./requirements.txt .
# RUN ls -al
# RUN conda install --file requirements.txt

# ### ACTIVATE JUPYTER_LAB ON DEFAULT PORT 8888
# # COPY JUPYTER-LAB CONFIGS
# COPY ./jupyter_lab_config.py /root/.jupyter/jupyter_lab_config.py
# RUN echo jupyter-lab --ip=0.0.0.0 --port ${JUPYTER_PORT} --no-browser --allow-root --ServerApp.token=\${JUPYTER_TOKEN}
# CMD nohup jupyter-lab --ip=0.0.0.0 --port ${JUPYTER_PORT} --no-browser --allow-root --ServerApp.token=\${JUPYTER_TOKEN} & 
# # RUN ["echo","jupyter-lab", "--ip=0.0.0.0 --port", "echo ${JUPYTER_PORT}","--no-browser --allow-root --ServerApp.token=","echo ${JUPYTER_TOKEN}"]
# # CMD ["jupyter-lab", "--ip=0.0.0.0 --port", "echo ${JUPYTER_PORT}","--no-browser --allow-root --ServerApp.token=","echo ${JUPYTER_TOKEN}"]