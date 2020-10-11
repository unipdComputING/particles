classdef PARTICLE < handle
  %------------------------------------------------------------------------
  properties
    x = [];
    v = [];
    a = [];
    f = [];
    mass = 0.0;
    damp = 0.0;
    texture;
    dim_texture = 20;
  end
  %------------------------------------------------------------------------
  methods
    %----------------------------------------------------------------------
    function this=PARTICLE(x, mass, damp)
      this.x = x;
      this.mass = mass;
      this.damp = damp;
      this.v = zeros(2, 1);
      this.a = zeros(2, 1); 
      this.f = zeros(2, 1);
      this.texture = imread('angry_bird.png');
      %this.texture = imresize(this.texture, 1.0);
      %this.texture = imrotate(this.texture, 35,'bilinear');
    end
    %----------------------------------------------------------------------
    function addLoad(this,f)
      this.f = this.f + f;
    end
    %----------------------------------------------------------------------
    function update(this, dTime, box)
      this.a = this.f / this.mass;
      this.v = this.v + this.a * dTime;
      this.x = this.x + this.v * dTime;
      this.f = zeros(2, 1);
      this.boundary(box);
    end
    %----------------------------------------------------------------------
    function boundary(this, box)
      minx = box.x(1);
      maxx = box.x(1) + box.width;
      miny = box.x(2);
      maxy = box.x(2) + box.height;
      if (this.x(1) - this.dim_texture/2 < minx)
        this.v(1) = -1 * this.v(1);
        this.x(1) = minx + this.dim_texture/2;
      elseif (this.x(1) + this.dim_texture/2 > maxx)
        this.v(1) = -1 * this.v(1);
        this.x(1) = maxx - this.dim_texture/2;  
      end
      
      if (this.x(2) - this.dim_texture/2 < miny)
        this.v(2) = -1 * this.v(2);
        this.x(2) = miny + this.dim_texture/2;
      elseif (this.x(2) + this.dim_texture/2 > maxy)
        this.v(2) = -1 * this.v(2);
        this.x(2) = maxy - this.dim_texture/2;  
      end
    end
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
    function draw(this, ID_Fig)
      textrsize = [this.dim_texture,this.dim_texture];
      x_low = this.x(1) - textrsize(1)/2; %//Left edge of texture
      x_high = this.x(1) + textrsize(1)/2;%//Right edge of texture
      y_low = this.x(2) - textrsize(2)/2; %//Bottom edge of texture
      y_high = this.x(2) + textrsize(2)/2;%//Top edge of texture
      hold on
      figure(ID_Fig);
      %plot(this.x(1), this.x(2), angry_birds);
      imagesc([x_low; x_high], [y_low; y_high],this.texture);
      %imshow(ab);
      hold off
    end
    %----------------------------------------------------------------------
  end
end