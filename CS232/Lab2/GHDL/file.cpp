#include "rb.h"
#include<iostream>
using namespace std;
using ptr = RedBlackTree::ptr;

RedBlackTree::RedBlackTree(){
	node* root = new node(0);
}

const ptr RedBlackTree::getRoot() const
{ 
	return root; 
}

ptr RedBlackTree::insert(int data)
{
	ptr newnodePtr = new node(data);
	if (!root) {
		root = newnodePtr;
		root->color = 0; // set root color as black
		return newnodePtr;
	}
	insert(root, newnodePtr);
	return newnodePtr;
}

// auxiliary function to perform RBT insertion of a node
// you may assume start is not nullptr
void RedBlackTree::insert(ptr start, ptr newnodePtr)
{
	// choose direction
	ptr y=nullptr;
	while(start!=nullptr)
	{
		y=start;
		if(start->data>newnodePtr->data)
		{
			start=start->left;
		}
		else{
			start=start->right;
		}
	}
	if(y->data>newnodePtr->data)
	{
		y->left=newnodePtr;
	}
	else{
		y->right=newnodePtr;
	}
	newnodePtr->parent=y;
	// recurse down the tree

	return;
}

// Credits to Adrian Schneider
void RedBlackTree::printRBT(ptr start, const std::string& prefix, bool isLeftChild) const
{
	if (!start) return;

	std::cout << prefix;
	std::cout << (isLeftChild ? "|--" : "|__" );
	// print the value of the node
	std::cout << start->data << "(" << start->color << ")" << std::endl;
	// enter the next tree level - left and right branch
	printRBT(start->left, prefix + (isLeftChild ? "│   " : "    "), true);
	printRBT(start->right, prefix + (isLeftChild ? "│   " : "    "), false);
}

// Function performing right rotation
// of the passed node
void RedBlackTree::rightrotate(ptr loc) {
    if (!loc || !loc->left) {
        return; 
    }
    ptr temp1 = loc;
    ptr temp2 = nullptr;
    if(loc->parent){temp2=loc->parent;}
    ptr t = loc->left;
    ptr temp3 = nullptr;

    if (t->right) {
        temp3 = t->right;
    }
    if(!temp2)
    {
    	t->right = temp1;
        temp1->parent = t;
        if (temp3) {
            temp1->left = temp3;
            temp3->parent = temp1;
        }

    }

    if (temp2 && temp2->left == loc) {
    	t->right = temp1;
        temp1->parent = t;
        temp2->left = t;
        t->parent = temp2;
        

        if (temp3) {
            temp1->left = temp3;
            temp3->parent = temp1;
        }
    } else if(temp2&&temp2->right==loc){
        temp2->right = t;
        t->parent = temp2;
        t->right = temp1;
        temp1->parent = t;

        if (temp3) {
            temp1->left = temp3;
            temp3->parent = temp1;
        }
    }

    if (!loc->parent->parent) {
        root = loc->parent;
    }
}

// Function performing left rotation
// of the passed node
void RedBlackTree::leftrotate(ptr loc) {
    if (!loc || !loc->right) {
    	cout<<"A"<<endl;
        return; // No parent or no node to rotate, nothing to do.
    }

    ptr temp1 = loc;
    ptr temp2 = nullptr;
    if(loc->parent){temp2=loc->parent;}
	ptr t = loc->right;
    ptr temp3 = nullptr;

    if (t->left) {
        temp3 = t->left;
    }
        	cout<<"b"<<endl;

    if(!temp2)
    {
    	    	cout<<"c"<<endl;

    	t->left = temp1;
        temp1->parent = t;
        t->parent = nullptr; // Update the parent pointer
        if (temp3) {
            temp1->right = temp3;
            temp3->parent = temp1;
        }

    }
    if (temp2 && temp2->left == loc) {
    	    	cout<<"d"<<endl;

        temp2->left = t;
        t->parent = temp2;
        t->left = temp1;
        temp1->parent = t;

        if (temp3) {
            temp1->right = temp3;
            temp3->parent = temp1;
        }
    } else if(temp2 && temp2->right == loc){
    	    	cout<<"e"<<endl;

        temp2->right = t;
        t->parent = temp2;
        t->left = temp1;
        temp1->parent = t;

        if (temp3) {
            temp1->right = temp3;
            temp3->parent = temp1;
        }
    }

    if (loc->parent && !loc->parent->parent) {
    	    	cout<<"f"<<endl;

        root = loc->parent;
    }
}

// This function fixes violations
// caused by RBT insertion
void RedBlackTree::fixup(ptr loc)
{
	bool straightpath=false;
	ptr te1=loc;
	ptr te2=NULL;
	ptr te3=NULL;
	ptr sib=nullptr;
	if(loc->parent)
	{
			te2=loc->parent;
	}
	if(loc->parent&&loc->parent->parent)
	{
			te3=loc->parent->parent;
	}
	if((te3)&&(te3->right)&&(te3->left))
	{
		if(te3->right==te2)
		{
			sib=te3->left;
		}
		else
		{

			sib=te3->right;
		}
	}
	if(te3&&te3->left&&te3->left->left)
	{
		if(te3->left->left==loc)straightpath=true;
	}
	if(te3&&te3->right&&te3->right->right)
	{
		if(te3->right->right==loc)straightpath=true;
	}
	bool red=false;
	if(sib){if(sib->color==1)
	{
		red=true;
	}}
	if(!te2||te2->color==0){return;}
	if(te2){
	if(te2->color==1)//means red red violation
	{
		//case1
		if(red)
		{	//recoloring
			te2->color=1-te2->color;
			sib->color=1-sib->color;
			te3->color=1-te3->color;
			//possibility
			if(te3->parent)
			{
				if(te3->parent->color==1)
				{
					fixup(te3);
				}
			}
			//possibility
			else if(!te3->parent)
			{
				te3->color=0;
			}
		}
		//case2
		if(!red&&!straightpath)
		{
			if(te2->left&&te2->left==loc)
			{
				rightrotate(te2);
			}
			else if(te2->right&&te2->right==loc)
			{
				leftrotate(te2);
			}
		}
		//case3
		if(!red && straightpath)
		{
			if(te3->left&&te3->left==te2)
			{
				rightrotate(te3);
				te3->color=1-te3->color;
				te2->color=1-te2->color;
			}
			else if(te3->right&&te3->right==te2)
			{
				leftrotate(te3);
				te3->color=1-te3->color;
				te2->color=1-te2->color;
			}
		}
	
	}}
}


// Function to print inorder traversal
// of the fixated tree
void RedBlackTree::inorder(ptr start) const
{
	if (!start)
		return;
	
	inorder(start->left);
	std::cout << start->data << " ";
	inorder(start->right);
}

// driver code
int main()
{
	int n; std :: cin >> n;
	assert (n < 10000 && n >= 0);
	int a[10000];
	RedBlackTree tree;
	for (int i = 0; i < n; i++) {
		std::cin >> a[i];

		// allocating memory to the node and initializing:
		// 1. color as red
		// 2. parent, left and right pointers as NULL
		// 3. data as i-th value in the array

		// calling function that performs rbt insertion of
		// this newly created node
		auto newnodePtr = tree.insert(a[i]);

		// calling function to preserve properties of rb
		// tree
		//tree.fixup(newnodePtr);
		if(i==2)
		{
			cout<<"x"<<endl;
			tree.leftrotate(tree.getRoot());
		}
		
	}
	tree.printRBT(tree.getRoot());
	tree.inorder(tree.getRoot());
	return 0;
}