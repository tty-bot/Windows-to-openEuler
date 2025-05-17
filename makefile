ifneq ($(KERNELRELEASE),)
	obj-m := kmalloc.o
else
	KERNELDIR ?=/usr/src/kernels/kernel-4.19.90-2405.5.0
	PWD := $(shell pwd)
default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
endif
.PHONY:clean
clean:
	-rm *.mod.c *.o *.order *.symvers *.ko