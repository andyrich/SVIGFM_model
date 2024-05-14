
# coding: utf-8

# In[164]:

import numpy as np
import sys as sys
import os as os


# In[165]:

print "\n\n\nRunning the k-lithology calculation script.\n\n"


# In[166]:

vals = cors = np.loadtxt('k_interp.csv',delimiter = ',',skiprows = 1)

for layer in [1,3,4,5,6]:
    try:
        os.remove('Vk_'+str(int(layer))+'.csv')
        os.remove('Hk_'+str(int(layer))+'.csv')
    except:
        pass
print "\tOld HK And VK files removed"


# In[177]:

for layer in [1,3,4,5,6]:
    cors = np.loadtxt('lay'+str(int(layer))+'_p_cors.csv',delimiter = ',')
    volc = np.loadtxt('lay'+str(int(layer))+'_p_volc.csv',delimiter = ',')
    mix = np.loadtxt('lay'+str(int(layer))+'_p_mix.csv',delimiter = ',')
    
    p=vals[layer-1,1]
    cor_m = vals[layer-1,2]
    volc_m =vals[layer-1,3]
    mix_m = vals[layer-1,4]
    
    print 'LAYER ___{:}___ \n\n \t{:} = p\n \t{:} = cor_m\n \t{:} = volc_m\n \t{:} = mix_m\n'.format(layer,p,cor_m, volc_m, mix_m)
    

    #filter values for zeros
    def rem_zeros(vals):
        c_ =(vals<0)
        vals[c_] = 0.
        return vals
    cors = rem_zeros(cors)
    volc = rem_zeros(volc)
    mix = rem_zeros(mix)

    def horz_k(cors,volc, mix, cor_m,volc_m, mix_m):
    #     out = cors*cor_m+volc*volc_m+mix*mix_m
        out = volc*volc_m+mix*mix_m+cors*cor_m
        print '\tHORIZONTAL\tmin = '+str(np.min(np.min(out))) + ',     max = '+ str(np.max(np.max(out)))
        c_ = (out==0)
        out[c_] = -999
        print "\tsum of horizontal k CELL's greater than zero", + np.sum(~c_)
        
        return out

    horz = horz_k(cors,volc, mix, cor_m,volc_m, mix_m)



    def vert_k(p,cors,volc, mix, cor_m,volc_m, mix_m):
        kv = (cors*np.power(cor_m,p)+ 
              volc*np.power(volc_m,p)+
              mix*np.power(mix_m,p))
        kv = np.power(kv,1./p)
        c_ = (kv==np.inf)
        print '\tVERTICAL\tmin = '+str(np.min(np.min(kv))) 
        print "\tsum of VERTICAL k CELL's greater than zero", + np.sum(~c_)
        kv[c_] = -999        
        
        
        return kv

    vert = vert_k(p,cors,volc, mix, cor_m,volc_m, mix_m)

    np.savetxt('Vk_'+str(int(layer))+'.csv',vert,fmt='%.5g',delimiter = ',')
    np.savetxt('Hk_'+str(int(layer))+'.csv',horz,fmt='%.5g',delimiter = ',')
    
    print '\t\t files saved to  '+'Vk_'+str(int(layer))+'.csv' +'  and  ' +'Hk_'+str(int(layer))+'.csv'
    
    print "\n\tDone Calculating and Exporting Layer {:} in Lith Estimation Model\n".format(layer)
print "\n Done with k-lithology calculation script"

