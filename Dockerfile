FROM ubuntu:latest

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get update && apt-get install -y git python3 python3-pip build-essential curl

RUN pip install jupyterlab numpy pandas scikit-learn jupyter_console jupyter_client opencv-python torch

ENV PORT 8080
ENV password Fondness

EXPOSE 8080

CMD /bin/bash -c "jupyter notebook --NotebookApp.token='' --NotebookApp.password=$password --ip=0.0.0.0 --port=$PORT --no-browser --allow-root"
