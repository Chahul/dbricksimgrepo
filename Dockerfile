FROM databricksruntime/dbfsfuse:latest

RUN apt-get update \
  && apt-get install -y openssh-server \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Warning: the created user has root permissions inside the container
# Warning: you still need to start the ssh process with `sudo service ssh start`
RUN useradd --create-home --shell /bin/bash --groups sudo ubuntu
RUN /databricks/conda/envs/dcs-minimal/bin/pip install pandas
RUN /databricks/conda/envs/dcs-minimal/bin/pip install urllib3
