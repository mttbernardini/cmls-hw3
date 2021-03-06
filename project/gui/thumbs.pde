class SliderValue {
  float min_v, max_v;
  float v, drawn_v;
  float inertia;
  
  SliderValue(float miv, float mav, float ine) {
    min_v = miv;
    max_v = mav;
    inertia = ine;
  }
  
  boolean setValue(float new_v) {
    new_v = constrain(new_v, min_v, max_v);
    float old_v = v;
    v = new_v;
    return new_v != old_v;
  }
  
  void update() {
    drawn_v += (v - drawn_v) / inertia;
  }
  
  float position2value(float pos, float start, float end) {
    float ratio = constrain((pos - start) / (end - start), 0, 1);
    return (max_v - min_v) * ratio + min_v;
  }

  float value2position(float val, float start, float end) {
    float ratio = (val - min_v) / (max_v - min_v);
    return ratio * (end - start) + start;
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

}
