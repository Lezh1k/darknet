TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

DEFINES += OPENCV
INCLUDEPATH += \
    /usr/include/opencv4 \
    /usr/include/opencv4/opencv2 \
    include \
    src

SOURCES +=  \
    examples/art.c \
    examples/attention.c \
    examples/captcha.c \
    examples/cifar.c \
    examples/classifier.c \
    examples/coco.c \
    examples/darknet.c \
    examples/detector.c \
    examples/dice.c \
    examples/go.c \
    examples/instance-segmenter.c \
    examples/lsd.c \
    examples/nightmare.c \
    examples/regressor.c \
    examples/rnn.c \
    examples/rnn_vid.c \
    examples/segmenter.c \
    examples/super.c \
    examples/swag.c \
    examples/tag.c \
    examples/voxel.c \
    examples/writing.c \
    examples/yolo.c \
    src/activation_layer.c \
    src/activations.c \
    src/avgpool_layer.c \
    src/batchnorm_layer.c \
    src/blas.c \
    src/box.c \
    src/col2im.c \
    src/compare.c \
    src/connected_layer.c \
    src/convolutional_layer.c \
    src/cost_layer.c \
    src/crnn_layer.c \
    src/crop_layer.c \
    src/cuda.c \
    src/data.c \
    src/deconvolutional_layer.c \
    src/demo.c \
    src/detection_layer.c \
    src/dropout_layer.c \
    src/gemm.c \
    src/gru_layer.c \
    src/im2col.c \
    src/image.c \
    src/image_opencv.cpp \
    src/iseg_layer.c \
    src/l2norm_layer.c \
    src/layer.c \
    src/list.c \
    src/local_layer.c \
    src/logistic_layer.c \
    src/lstm_layer.c \
    src/matrix.c \
    src/maxpool_layer.c \
    src/network.c \
    src/normalization_layer.c \
    src/option_list.c \
    src/parser.c \
    src/region_layer.c \
    src/reorg_layer.c \
    src/rnn_layer.c \
    src/route_layer.c \
    src/shortcut_layer.c \
    src/softmax_layer.c \
    src/tree.c \
    src/upsample_layer.c \
    src/utils.c \
    src/yolo_layer.c

DISTFILES += \
    src/activation_kernels.cu \
    src/avgpool_layer_kernels.cu \
    src/blas_kernels.cu \
    src/col2im_kernels.cu \
    src/convolutional_kernels.cu \
    src/crop_layer_kernels.cu \
    src/deconvolutional_kernels.cu \
    src/dropout_layer_kernels.cu \
    src/im2col_kernels.cu \
    src/maxpool_layer_kernels.cu

HEADERS += \
    include/darknet.h \
    src/activation_layer.h \
    src/activations.h \
    src/avgpool_layer.h \
    src/batchnorm_layer.h \
    src/blas.h \
    src/box.h \
    src/classifier.h \
    src/col2im.h \
    src/connected_layer.h \
    src/convolutional_layer.h \
    src/cost_layer.h \
    src/crnn_layer.h \
    src/crop_layer.h \
    src/cuda.h \
    src/data.h \
    src/deconvolutional_layer.h \
    src/demo.h \
    src/detection_layer.h \
    src/dropout_layer.h \
    src/gemm.h \
    src/gru_layer.h \
    src/im2col.h \
    src/image.h \
    src/iseg_layer.h \
    src/l2norm_layer.h \
    src/layer.h \
    src/list.h \
    src/local_layer.h \
    src/logistic_layer.h \
    src/lstm_layer.h \
    src/matrix.h \
    src/maxpool_layer.h \
    src/network.h \
    src/normalization_layer.h \
    src/option_list.h \
    src/parser.h \
    src/region_layer.h \
    src/reorg_layer.h \
    src/rnn_layer.h \
    src/route_layer.h \
    src/shortcut_layer.h \
    src/softmax_layer.h \
    src/stb_image.h \
    src/stb_image_write.h \
    src/tree.h \
    src/upsample_layer.h \
    src/utils.h \
    src/yolo_layer.h
