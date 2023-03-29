#!/bin/bash

function makedirs () {
echo "1. create direcroies"
mkdir -p aws_library/{ec2/instances,elb/{load_balancers,volumes},rds/{clusters,instances},lambda/{buckets,objects,targets}}

echo "2. show as tree"
tree aws_library

echo "3. rename lambda to s3 in abs"
mv ${PWD}/aws_library/lambda ${PWD}/aws_library/s3

echo "4. move targets to elb in relative" 
mv aws_library/s3/targets aws_library/elb/

echo "5. move volumes to ec2"
mv aws_library/elb/volumes aws_library/ec2/

echo "6. copy dir instances to aws_library/"
cp -r aws_library/rds/instances aws_library/

echo "7. create cluster.txt in clusters"
touch aws_library/rds/clusters/cluster.txt

echo "8. delete aws_library"
sleep 3
rm -rvf ./aws_library/
}

makedirs
