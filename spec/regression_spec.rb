require 'spec_helper'
require 'game_icons'

# These are tests that will change with each release, but might find brokenness as we go.

describe GameIcons do
  it('has the expected number of icons') { expect(GameIcons.names.count).to eq(1999) }

  it 'loads known svg data' do
    exp = <<-EOSVG
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M0 0h512v512H0z"/><path d="M371.28 18.906c-40.78.092-82.526 21.026-110.624 65.813-35.57-51.667-93.288-71.73-143.5-61.47-54.427 11.12-99.783 58.946-97.47 134.688 2.17 70.978 43.028 120.858 91.25 168.53 48.225 47.674 104.27 94.2 141.97 159.5L261 500l8.094-14.03c37.55-65.042 95.404-109.375 144.625-156.064 49.22-46.69 90.167-97.202 87.905-172.53C499.49 86.238 455.06 36.64 401.875 22.81c-9.972-2.593-20.252-3.93-30.594-3.906zm-.06 18.532c8.754.06 17.462 1.233 25.936 3.437 45.197 11.753 83.9 53.345 85.813 117.063 2.054 68.423-33.94 112.727-82.095 158.406-44.992 42.678-100.275 85.296-139.844 147-39.266-61.85-92.684-106.41-136.936-150.156-47.363-46.823-83.76-91.68-85.72-155.813C36.29 89.075 74.47 51.05 120.907 41.562c46.437-9.487 101.338 10.72 131.938 65.844l8.5 15.375 8-15.655C294.42 57.898 333.28 37.17 371.22 37.437zM358.81 58.343c-1.67-.023-3.264.033-4.78.156-6.066.49-10.737 2.085-13.782 4.156-3.045 2.07-4.678 4.384-5.5 8-1.644 7.233 2.136 19.413 12.188 32.03 10.05 12.62 25.672 25.346 43.937 34.44 18.265 9.092 35.618 12.667 47.75 11.686 6.066-.49 10.705-2.085 13.75-4.156 3.045-2.07 4.71-4.384 5.53-8 1.645-7.232-2.166-19.38-12.217-32-10.052-12.62-25.642-25.345-43.907-34.437-15.98-7.957-31.27-11.718-42.967-11.876zm-210 .03c-1.315-.017-2.565.03-3.75.126-4.736.38-8.26 1.594-10.437 3.063-2.176 1.468-3.208 2.934-3.78 5.437-1.148 5.006 1.59 14.41 9.593 24.375 8 9.964 20.55 20.132 35.218 27.375 14.667 7.243 28.56 10.04 38.03 9.28 4.738-.378 8.263-1.624 10.44-3.093 2.175-1.468 3.207-2.934 3.78-5.437 1.147-5.006-1.592-14.41-9.594-24.375-8-9.964-20.55-20.1-35.218-27.344-12.834-6.336-25.076-9.28-34.28-9.405zm114.313 130c-54.47 0-103.808 4.458-138.938 11.5-17.564 3.523-31.616 7.76-40.5 11.97-4.44 2.105-7.545 4.263-9.062 5.75-.73.715-1.024 1.135-1.156 1.344.13.215.424.658 1.155 1.375 1.517 1.486 4.62 3.613 9.063 5.718 8.883 4.212 22.935 8.448 40.5 11.97 35.13 7.043 84.466 11.53 138.937 11.53 54.47 0 103.808-4.487 138.938-11.53 17.564-3.522 31.616-7.758 40.5-11.97 4.44-2.104 7.545-4.23 9.062-5.718.73-.716 1.024-1.16 1.156-1.375-.13-.208-.425-.628-1.155-1.343-1.517-1.487-4.62-3.645-9.063-5.75-8.883-4.21-22.935-8.447-40.5-11.97-35.13-7.042-84.466-11.5-138.937-11.5zM452.78 218.94c.144.225.095.203.095 0 0-.204.048-.232-.094 0zm-379.31 0c-.143-.232-.095-.204-.095 0 0 .203-.05.225.094 0zm364.592 29c-9.2 3.16-20.002 5.93-32.343 8.406-36.928 7.403-87.112 11.875-142.595 11.875-55.483 0-105.7-4.473-142.625-11.876-11.487-2.303-21.663-4.86-30.438-7.75 43.797 57.35 119.452 106.2 170.688 184.937 28.976-43.9 66.72-77.32 101.78-108.374 29.198-25.858 56.307-50.194 75.533-77.22z" fill="#fff"/></svg>
EOSVG
    exp.strip!
    expect(GameIcons.get('glass-heart').string). to eq(exp)
  end

  it "recolors everything without raising an error" do
    errors = ''
    Dir[File.expand_path('../resources/**/*.svg', File.dirname(__FILE__))].each do |svg|
      begin
        GameIcons::Icon.new(svg).recolor(fg: '#abc', bg: '#def')
      rescue StandardError => e
        errors << '*' * 20
        errors << e.to_s
        errors << '*' * 20
      end
      expect(errors).to eq('')
    end
  end

end
