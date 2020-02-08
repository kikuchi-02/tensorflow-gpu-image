# tensorflow用のベース環境

docker 19.03.5

python 3.7.5

NVIDIA 440

CUDA 10.0

cuDNN 7.4

gcc 7.4.0

bazel 1.2.0

tensorflow-gpu 2.0.0


## dockerのgpuオプション

docker-compose にはgpu optionが現在(2020/2/8)には存在しないため、docker-compose upではなく、下記のコマンドでコンテナを実行する。

    docker run -v $(pwd)/src:/root/src -it -p 8888:8888 --gpus all tensorflow_api