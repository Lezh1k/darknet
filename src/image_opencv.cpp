#ifdef OPENCV

#include "stdio.h"
#include "stdlib.h"
#include "opencv2/opencv.hpp"
#include "image.h"
#include "assert.h"

using namespace cv;

extern "C" {

static int TypeFromChannelsCount(int cn) {
  assert(cn >= 1 && cn <= 4);
  int types[4] = {CV_8UC1, CV_8UC2, CV_8UC3, CV_8UC4};
  return types[cn-1];
}

static Mat image_to_mat_internal(image im)
{
  Mat m(Size(im.w, im.h), TypeFromChannelsCount(im.c));
  size_t step = static_cast<size_t>(m.step);
  for(int y = 0; y < im.h; ++y){
    for(int x = 0; x < im.w; ++x){
      for(int c= 0; c < im.c; ++c){
        float val = im.data[c*im.h*im.w + y*im.w + x];
        m.data[y*step + x*im.c + c] = (unsigned char)(val*255);
      }
    }
  }
  return m;
}

static image mat_to_image_internal(const Mat& src)
{
  int h = src.rows;
  int w = src.cols;
  int c = src.channels();
  image im = make_image(w, h, c);
  unsigned char *data = (unsigned char *)src.data;
  size_t step = static_cast<size_t>(src.step);
  int i, j, k;

  for(i = 0; i < h; ++i){
    for(k= 0; k < c; ++k){
      for(j = 0; j < w; ++j){
        im.data[k*w*h + i*w + j] = data[i*step + j*c + k]/255.;
      }
    }
  }
  return im;
}

static Mat image_to_mat(image im)
{
  image copy = copy_image(im);
  constrain_image(copy);
  if(im.c == 3) rgbgr_image(copy);
  Mat m = image_to_mat_internal(copy);
  free_image(copy);
  return m;
}

static image mat_to_image(const Mat& m)
{  
  image im = mat_to_image_internal(m);
  rgbgr_image(im);
  return im;
}

void *open_video_stream(const char *f, int c, int w, int h, int fps)
{
  VideoCapture *cap;
  if(f) cap = new VideoCapture(f);
  else cap = new VideoCapture(c);
  if(!cap->isOpened()) return 0;
  if(w) cap->set(CAP_PROP_FRAME_WIDTH, w);
  if(h) cap->set(CAP_PROP_FRAME_HEIGHT, h);
  if(fps) cap->set(CAP_PROP_FPS, w);
  return (void *) cap;
}

image get_image_from_stream(void *p)
{
  VideoCapture *cap = (VideoCapture *)p;
  Mat m;
  *cap >> m;
  if(m.empty()) return make_empty_image(0,0,0);
  return mat_to_image(m);
}

image load_image_cv(char *filename, int channels)
{
  int flag = IMREAD_UNCHANGED;
  if (channels == 0) flag = IMREAD_UNCHANGED;
  else if (channels == 1) flag = IMREAD_GRAYSCALE;
  else if (channels == 3) flag = IMREAD_COLOR;
  else {
    fprintf(stderr, "OpenCV can't force load with %d channels\n", channels);
  }
  Mat m;
  m = imread(filename, flag);
  if(!m.data){
    fprintf(stderr, "Cannot load image \"%s\"\n", filename);
    char buff[256];
    sprintf(buff, "echo %s >> bad.list", filename);
    system(buff);
    return make_image(10,10,3);
    //exit(0);
  }
  image im = mat_to_image(m);
  return im;
}

int show_image_cv(image im, const char* name, int ms)
{
  Mat m = image_to_mat(im);
  imshow(name, m);
  int c = waitKey(ms);
  if (c != -1) c = c%256;
  return c;
}

void make_window(char *name, int w, int h, int fullscreen)
{
  namedWindow(name, WINDOW_NORMAL);
  if (fullscreen) {
    setWindowProperty(name, WND_PROP_FULLSCREEN, WINDOW_FULLSCREEN);
  } else {
    resizeWindow(name, w, h);
    if(strcmp(name, "Demo") == 0) moveWindow(name, 0, 0);
  }
}

}

#endif
