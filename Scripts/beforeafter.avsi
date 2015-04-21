##################################################################
# BeforeAfter                                                    #
#   e.g.                                                         #
# beforeafter(clip, placement, filters)  or                      #
#                                                                #
# beforeafterline(clip, placement,filters) for a lined split     #
#                                                                #
# 1 for vertical splitscreen, 0 for horizontal splitscreen       #
#                                                                #
# Use triple quotes """ """ if filter contains a string          #
##################################################################

function beforeafter(clip a, int "placement", string "filters"){

placement = default(placement, 1)

Assert((float(width(a))/16)==round(width(a)/16), "Source image width must be a multiple of 16")

b=Eval("a."+filters)
c = (placement==1) ? stackhorizontal(a.crop(0,0,-((ceil(float(width(a))/32))*16),0).subtitle("before"),b.crop(((floor(float(width(a))/32))*16),0,0,0).subtitle("after")) :Stackvertical(a.crop(0,0,0,-height(a)/2).subtitle("Before"),b.crop(0,height(a)/2,0,0).subtitle("After"))

return c
}

function beforeafterline(clip a, int "placement", string "filters"){ 
  
 placement = default(placement, 1) 
  
 Assert((float(width(a))/16)==round(width(a)/16), "Source image width must be a multiple of 16") 
  
 b=Eval("a."+filters) 
 c = (placement==1) ? stackhorizontal(a.crop(0,0,-((ceil(float(width(a))/32))*16),0).subtitle("before"),b.crop(((floor(float(width(a))/32))*16),0,0,0).subtitle("after")) :Stackvertical(a.crop(0,0,0,-height(a)/2).subtitle("Before"),b.crop(0,height(a)/2,0,0).subtitle("After")) 
 line = (placement!=1) ? blankclip(a,color=$FFFFFF).crop(0,0,(width(a)),4) : blankclip(a,color=$FFFFFF).crop(0,0,4,(height(a))) 
 d = (placement==1) ? overlay(c,line,x=width(a)-((ceil(float(width(a))/32))*16)-2) : overlay(c,line,y=height(a)-((floor(float(height(a))/32))*16)-2) 
  
 return d 
 } 