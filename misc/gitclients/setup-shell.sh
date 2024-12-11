#!/bin/bash
echo 'eval "$(oh-my-posh init bash --config /root/.cache/oh-my-posh/themes/$POSH_FILE_NAME)"' >> /root/.bashrc;

echo "Actualizando Tema";
source /root/.bashrc