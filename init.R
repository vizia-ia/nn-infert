# init.R -> o nome do arquivo PRECISA ser esse pro heroku visualizar
#

#TEM QUE ADICIOANR TODOS OS PACOTES QUE O APP VAI PRECISAR. PRINCIPALMENTE O QUE CRIOU O MODELO RDS
pacotes = c("neuralnet")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p)
  }
}

invisible(sapply(pacotes, install_if_missing))
