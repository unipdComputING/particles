classdef BOX < handle
  %------------------------------------------------------------------------
  properties
    width;
    height;
    x = [];
  end
  %------------------------------------------------------------------------
  methods
    %----------------------------------------------------------------------
    function this = BOX(width, height, x)
      this.width = width;
      this.height = height;
      this.x = x;
    end
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
    function draw(this, ID_fig)
      figure(ID_fig);
      x1 = this.x(1);
      x2 = this.x(1) + this.width;
      y1 = this.x(2);
      y2 = this.x(2) + this.height;
      X = [x1; x2; x2; x1;];
      Y = [y1; y1; y2; y2;];
      plot(X,Y, 'k');
      axis([x1 x2 y1 y2]);
    end
    %----------------------------------------------------------------------
  end
  %------------------------------------------------------------------------
end