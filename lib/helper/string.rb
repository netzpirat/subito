#
# Adds colorization to String class
#
class String
    def red; colorize(self, "\e[1m\e[31m"); end
    def dark_red; colorize(self, "\e[31m"); end
    
    def green; colorize(self, "\e[1m\e[32m"); end
    def dark_green; colorize(self, "\e[32m"); end
    
    def yellow; colorize(self, "\e[1m\e[33m"); end
    def dark_yellow; colorize(self, "\e[33m"); end
    
    def blue; colorize(self, "\e[1m\e[34m"); end
    def dark_blue; colorize(self, "\e[34m"); end
    
    def magenta; colorize(self, "\e[1m\e[35m"); end
    def dark_magenta; colorize(self, "\e[35m"); end
    
    def cyan; colorize(self, "\e[1m\e[36m"); end
    def dark_cyan; colorize(self, "\e[36m"); end    
    
    def white; colorize(self, "\e[1m\e[37m"); end
    def dark_white; colorize(self, "\e[37m"); end
      
    def colorize(text, color_code)  "#{color_code}#{text}\e[0m" end
end