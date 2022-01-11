# Copyright (C) 2021  Ruby-GNOME Project Team
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

require_relative "ruby-seekable"

module Gio
  class RubyOutputStream < OutputStream
    type_register("RubyOutputStream")

    include Seekable
    include RubySeekable

    def initialize(ruby_output)
      @ruby_output = ruby_output
      super()
    end

    private
    def ruby_io
      @ruby_output
    end

    def virtual_do_write_fn(buffer, cancellable)
      @ruby_output.write(buffer)
    end

    def virtual_do_flush(cancellable)
      @ruby_output.flush
    end

    def virtual_do_close_fn(cancellable)
      @ruby_output.close
    end
  end
end