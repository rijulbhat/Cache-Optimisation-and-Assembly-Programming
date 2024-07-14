
program2:	file format elf64-x86-64

Disassembly of section .init:

0000000000401000 <_init>:
  401000: f3 0f 1e fa                  	endbr64
  401004: 48 83 ec 08                  	subq	$8, %rsp
  401008: 48 8b 05 e9 2f 00 00         	movq	12265(%rip), %rax       # 0x403ff8 <program2.c+0x403ff8>
  40100f: 48 85 c0                     	testq	%rax, %rax
  401012: 74 02                        	je	0x401016 <_init+0x16>
  401014: ff d0                        	callq	*%rax
  401016: 48 83 c4 08                  	addq	$8, %rsp
  40101a: c3                           	retq

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020: ff 35 e2 2f 00 00            	pushq	12258(%rip)             # 0x404008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026: ff 25 e4 2f 00 00            	jmpq	*12260(%rip)            # 0x404010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c: 0f 1f 40 00                  	nopl	(%rax)

0000000000401030 <printf@plt>:
  401030: ff 25 e2 2f 00 00            	jmpq	*12258(%rip)            # 0x404018 <_GLOBAL_OFFSET_TABLE_+0x18>
  401036: 68 00 00 00 00               	pushq	$0
  40103b: e9 e0 ff ff ff               	jmp	0x401020 <.plt>

0000000000401040 <__isoc99_scanf@plt>:
  401040: ff 25 da 2f 00 00            	jmpq	*12250(%rip)            # 0x404020 <_GLOBAL_OFFSET_TABLE_+0x20>
  401046: 68 01 00 00 00               	pushq	$1
  40104b: e9 d0 ff ff ff               	jmp	0x401020 <.plt>

Disassembly of section .text:

0000000000401050 <_start>:
  401050: f3 0f 1e fa                  	endbr64
  401054: 31 ed                        	xorl	%ebp, %ebp
  401056: 49 89 d1                     	movq	%rdx, %r9
  401059: 5e                           	popq	%rsi
  40105a: 48 89 e2                     	movq	%rsp, %rdx
  40105d: 48 83 e4 f0                  	andq	$-16, %rsp
  401061: 50                           	pushq	%rax
  401062: 54                           	pushq	%rsp
  401063: 49 c7 c0 70 12 40 00         	movq	$4199024, %r8           # imm = 0x401270
  40106a: 48 c7 c1 00 12 40 00         	movq	$4198912, %rcx          # imm = 0x401200
  401071: 48 c7 c7 a7 11 40 00         	movq	$4198823, %rdi          # imm = 0x4011A7
  401078: ff 15 72 2f 00 00            	callq	*12146(%rip)            # 0x403ff0 <program2.c+0x403ff0>
  40107e: f4                           	hlt
  40107f: 90                           	nop

0000000000401080 <_dl_relocate_static_pie>:
  401080: f3 0f 1e fa                  	endbr64
  401084: c3                           	retq
  401085: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  40108f: 90                           	nop

0000000000401090 <deregister_tm_clones>:
  401090: b8 38 40 40 00               	movl	$4210744, %eax          # imm = 0x404038
  401095: 48 3d 38 40 40 00            	cmpq	$4210744, %rax          # imm = 0x404038
  40109b: 74 13                        	je	0x4010b0 <deregister_tm_clones+0x20>
  40109d: b8 00 00 00 00               	movl	$0, %eax
  4010a2: 48 85 c0                     	testq	%rax, %rax
  4010a5: 74 09                        	je	0x4010b0 <deregister_tm_clones+0x20>
  4010a7: bf 38 40 40 00               	movl	$4210744, %edi          # imm = 0x404038
  4010ac: ff e0                        	jmpq	*%rax
  4010ae: 66 90                        	nop
  4010b0: c3                           	retq
  4010b1: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  4010bc: 0f 1f 40 00                  	nopl	(%rax)

00000000004010c0 <register_tm_clones>:
  4010c0: be 38 40 40 00               	movl	$4210744, %esi          # imm = 0x404038
  4010c5: 48 81 ee 38 40 40 00         	subq	$4210744, %rsi          # imm = 0x404038
  4010cc: 48 89 f0                     	movq	%rsi, %rax
  4010cf: 48 c1 ee 3f                  	shrq	$63, %rsi
  4010d3: 48 c1 f8 03                  	sarq	$3, %rax
  4010d7: 48 01 c6                     	addq	%rax, %rsi
  4010da: 48 d1 fe                     	sarq	%rsi
  4010dd: 74 11                        	je	0x4010f0 <register_tm_clones+0x30>
  4010df: b8 00 00 00 00               	movl	$0, %eax
  4010e4: 48 85 c0                     	testq	%rax, %rax
  4010e7: 74 07                        	je	0x4010f0 <register_tm_clones+0x30>
  4010e9: bf 38 40 40 00               	movl	$4210744, %edi          # imm = 0x404038
  4010ee: ff e0                        	jmpq	*%rax
  4010f0: c3                           	retq
  4010f1: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  4010fc: 0f 1f 40 00                  	nopl	(%rax)

0000000000401100 <__do_global_dtors_aux>:
  401100: f3 0f 1e fa                  	endbr64
  401104: 80 3d 2d 2f 00 00 00         	cmpb	$0, 12077(%rip)         # 0x404038 <completed.0>
  40110b: 75 13                        	jne	0x401120 <__do_global_dtors_aux+0x20>
  40110d: 55                           	pushq	%rbp
  40110e: 48 89 e5                     	movq	%rsp, %rbp
  401111: e8 7a ff ff ff               	callq	0x401090 <deregister_tm_clones>
  401116: c6 05 1b 2f 00 00 01         	movb	$1, 12059(%rip)         # 0x404038 <completed.0>
  40111d: 5d                           	popq	%rbp
  40111e: c3                           	retq
  40111f: 90                           	nop
  401120: c3                           	retq
  401121: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  40112c: 0f 1f 40 00                  	nopl	(%rax)

0000000000401130 <frame_dummy>:
  401130: f3 0f 1e fa                  	endbr64
  401134: eb 8a                        	jmp	0x4010c0 <register_tm_clones>

0000000000401136 <func>:
  401136: 55                           	pushq	%rbp
  401137: 48 89 e5                     	movq	%rsp, %rbp
  40113a: 53                           	pushq	%rbx
  40113b: 48 83 ec 28                  	subq	$40, %rsp
  40113f: 48 89 7d d8                  	movq	%rdi, -40(%rbp)
  401143: 48 83 7d d8 00               	cmpq	$0, -40(%rbp)
  401148: 75 07                        	jne	0x401151 <func+0x1b>
  40114a: b8 01 00 00 00               	movl	$1, %eax
  40114f: eb 50                        	jmp	0x4011a1 <func+0x6b>
  401151: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
  401159: 48 c7 45 e0 01 00 00 00      	movq	$1, -32(%rbp)
  401161: eb 30                        	jmp	0x401193 <func+0x5d>
  401163: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  401167: 48 83 e8 01                  	subq	$1, %rax
  40116b: 48 89 c7                     	movq	%rax, %rdi
  40116e: e8 c3 ff ff ff               	callq	0x401136 <func>
  401173: 48 89 c3                     	movq	%rax, %rbx
  401176: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  40117a: 48 2b 45 e0                  	subq	-32(%rbp), %rax
  40117e: 48 89 c7                     	movq	%rax, %rdi
  401181: e8 b0 ff ff ff               	callq	0x401136 <func>
  401186: 48 0f af c3                  	imulq	%rbx, %rax
  40118a: 48 01 45 e8                  	addq	%rax, -24(%rbp)
  40118e: 48 83 45 e0 01               	addq	$1, -32(%rbp)
  401193: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  401197: 48 39 45 d8                  	cmpq	%rax, -40(%rbp)
  40119b: 73 c6                        	jae	0x401163 <func+0x2d>
  40119d: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  4011a5: c9                           	leave
  4011a6: c3                           	retq

00000000004011a7 <main>:
  4011a7: 55                           	pushq	%rbp
  4011a8: 48 89 e5                     	movq	%rsp, %rbp
  4011ab: 48 83 ec 10                  	subq	$16, %rsp
  4011af: bf 08 20 40 00               	movl	$4202504, %edi          # imm = 0x402008
  4011b4: b8 00 00 00 00               	movl	$0, %eax
  4011b9: e8 72 fe ff ff               	callq	0x401030 <printf@plt>
  4011be: 48 8d 45 f8                  	leaq	-8(%rbp), %rax
  4011c2: 48 89 c6                     	movq	%rax, %rsi
  4011c5: bf 27 20 40 00               	movl	$4202535, %edi          # imm = 0x402027
  4011ca: b8 00 00 00 00               	movl	$0, %eax
  4011cf: e8 6c fe ff ff               	callq	0x401040 <__isoc99_scanf@plt>
  4011d4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  4011d8: 48 89 c7                     	movq	%rax, %rdi
  4011db: e8 56 ff ff ff               	callq	0x401136 <func>
  4011e0: 48 89 c6                     	movq	%rax, %rsi
  4011e3: bf 2c 20 40 00               	movl	$4202540, %edi          # imm = 0x40202C
  4011e8: b8 00 00 00 00               	movl	$0, %eax
  4011ed: e8 3e fe ff ff               	callq	0x401030 <printf@plt>
  4011f2: b8 00 00 00 00               	movl	$0, %eax
  4011f7: c9                           	leave
  4011f8: c3                           	retq
  4011f9: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000401200 <__libc_csu_init>:
  401200: f3 0f 1e fa                  	endbr64
  401204: 41 57                        	pushq	%r15
  401206: 4c 8d 3d f3 2b 00 00         	leaq	11251(%rip), %r15       # 0x403e00 <__init_array_start>
  40120d: 41 56                        	pushq	%r14
  40120f: 49 89 d6                     	movq	%rdx, %r14
  401212: 41 55                        	pushq	%r13
  401214: 49 89 f5                     	movq	%rsi, %r13
  401217: 41 54                        	pushq	%r12
  401219: 41 89 fc                     	movl	%edi, %r12d
  40121c: 55                           	pushq	%rbp
  40121d: 48 8d 2d e4 2b 00 00         	leaq	11236(%rip), %rbp       # 0x403e08 <__do_global_dtors_aux_fini_array_entry>
  401224: 53                           	pushq	%rbx
  401225: 4c 29 fd                     	subq	%r15, %rbp
  401228: 48 83 ec 08                  	subq	$8, %rsp
  40122c: e8 cf fd ff ff               	callq	0x401000 <_init>
  401231: 48 c1 fd 03                  	sarq	$3, %rbp
  401235: 74 1f                        	je	0x401256 <__libc_csu_init+0x56>
  401237: 31 db                        	xorl	%ebx, %ebx
  401239: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  401240: 4c 89 f2                     	movq	%r14, %rdx
  401243: 4c 89 ee                     	movq	%r13, %rsi
  401246: 44 89 e7                     	movl	%r12d, %edi
  401249: 41 ff 14 df                  	callq	*(%r15,%rbx,8)
  40124d: 48 83 c3 01                  	addq	$1, %rbx
  401251: 48 39 dd                     	cmpq	%rbx, %rbp
  401254: 75 ea                        	jne	0x401240 <__libc_csu_init+0x40>
  401256: 48 83 c4 08                  	addq	$8, %rsp
  40125a: 5b                           	popq	%rbx
  40125b: 5d                           	popq	%rbp
  40125c: 41 5c                        	popq	%r12
  40125e: 41 5d                        	popq	%r13
  401260: 41 5e                        	popq	%r14
  401262: 41 5f                        	popq	%r15
  401264: c3                           	retq
  401265: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)

0000000000401270 <__libc_csu_fini>:
  401270: f3 0f 1e fa                  	endbr64
  401274: c3                           	retq

Disassembly of section .fini:

0000000000401278 <_fini>:
  401278: f3 0f 1e fa                  	endbr64
  40127c: 48 83 ec 08                  	subq	$8, %rsp
  401280: 48 83 c4 08                  	addq	$8, %rsp
  401284: c3                           	retq
