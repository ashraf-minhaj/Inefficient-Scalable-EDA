echo "arg: $1"

# bash $(pwd)/Terraform/scripts/plan.sh dev

# cd ../../
# # apt-get install libzip-dev
# # apt-get install zip

# echo "zipping source files."
# zip ./src/src.zip src
# # zip -FSr ./src/src.zip src

cd ../
ls -a

if [[ "$1" == "dev" || "$1" == "stage" || "$1" == "prod" ]]; 
    then
        echo "Planning for environement: $1"
        terraform plan -var-file=terraform.$1.tfvars
    else
        echo "Wrong Argument"
        echo "Pass 'dev', 'stage' or 'prod' only."
fi 