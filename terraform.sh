#!/usr/bin/env bash

# Set return when get an exist code is not 0
set +u;

# Export environment variables
WORKING_DIR=$(pwd)

print_banner() {
  echo "========= Start Terraform Modules ========="
}

generate_module() {

  if [ "$1" == "" ];then
    echo "PLease input module name";
  else
    if [ -d "$WORKING_DIR/modules/$1" ]; then
      echo "[ERROR] Module $1 exist.";
      exit 1;
    else
      mkdir "$WORKING_DIR/modules/$1";
      module_files=( "variables.tf" "output.tf" );
      for i in "${module_files[@]}"
      do
        touch "$WORKING_DIR/modules/$1/$i";
      done;

      echo "Created module $1";
    fi
  fi
}


generate_model() {

  if [ "$1" == "" ];then
    echo "Please in put model name"

  else
    if [ -d "$WORKING_DIR/models/$1" ]; then
      echo "[ERROR] Model $1 exist.";
    else
      mkdir "$WORKING_DIR/models/$1";
      model_files=( "main.tf" "provider.tf" )
      for i in "${model_files[@]}"
      do
        touch "$WORKING_DIR/models/$1/$i"
      done;
    fi
  fi
}



# Check required arguments
if [ "$1" == "" ];then
  echo "terraform [command] [subcommand]";
  exit 1;
fi

case "$1" in 
        generate)
          case "$2" in 
                  module)
                    generate_module $3;
                    ;;
                  model)
                    generate_model $3;
                    ;;
                  *)
                    echo "Usage: $1 {module|model}";
                    exit 2;
          esac
          ;;
      *)
        echo "Usage: $0 {generate|detele}"
        exit 1
esac