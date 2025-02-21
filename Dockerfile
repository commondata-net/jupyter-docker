FROM python:3.13-bookworm

RUN apt-get update && apt-get upgrade -y && apt-get install -y zsh sudo

RUN useradd -m -s /bin/zsh user

RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER user

WORKDIR /home/user

RUN touch ~/.zshrc
RUN echo "autoload -Uz colors && colors" >> ~/.zshrc
RUN echo "setopt PROMPT_SUBST" >> ~/.zshrc
RUN echo "PS1='%F{blue}[%D{%Y-%m-%d %H:%M:%S}]%f %F{green}%n%f@%F{yellow}container%f:%F{red}%~%f:[%?]%(!.#.$) '" >> ~/.zshrc

RUN pip install --upgrade pip && python -m venv venv
ENV PATH="/home/user/venv/bin:$PATH"

RUN pip install jupyterlab
RUN jupyter lab --generate-config
RUN echo "c.NotebookApp.terminado_settings = {'shell_command': ['/usr/bin/zsh']}" >> ~/.jupyter/jupyter_lab_config.py

ARG DEFAULT_PORT=8888
ENV PORT=${DEFAULT_PORT}

COPY bin ./bin

CMD ["/home/user/bin/run.sh"]
