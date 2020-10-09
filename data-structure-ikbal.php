
<!---------------------------------------- ARRAY ---------------------------------------------------->
<?php 

	// init the array 
$arr = ["ikbal", "maulana", "ganteng"];


	// calling the array. we should use the index of array for calling

	echo $arr[0]; // the result will  print string "ikbal" in browser

	// we can also init and give alias each index
	$arr = [
		"nama" => "ikbal maulana",
		"wajah" => "ganteng"
	];

	echo $arr['nama']; // the result will  print string "ikbal maulana" in browser
	
	?>


	<!---------------------------------------- STACK ---------------------------------------------------->
	<?php

	class Stack {

		protected $stack;
		protected $limit;

		public function __construct($limit = 10, $initial = array()) {
        // init stack
			$this->stack = $initial;
        // giving limit in stack (default 10)
			$this->limit = $limit;
		}

		public function push($item) {
        // trap for stack overflow
			if (count($this->stack) < $this->limit) {
            // prepend item to the start of the array
				array_unshift($this->stack, $item);
			} else {
        	// throw error exception if the limited of stack are full
				throw new RunTimeException('Stack is full!');
			}
		}

		public function pop() {
			if ($this->isEmpty()) {
            // throw error exception if the limited of stack are empty
				throw new RunTimeException('Stack is empty!');
			} else {
            // pop item from the start of the array
				return array_shift($this->stack);
			}
		}

		public function top() {
			return current($this->stack);
		}

		public function isEmpty() {
			return empty($this->stack);
		}

	}

// try or calling the stack, i am createing this stack in class so we should make instance of object
$stack = new Stack(); // instance object

// pushing stack
$stack->push(1);
$stack->push(2);
$stack->push(3);
$stack->push(4);
$stack->push(5);

// so if we want to pop or pull or delete we can use $stack->pop

?>



<!---------------------------------------- QUEUE ----------------------------------------------------> 
<?php 

class Element{
	public $value;
	public $next;
}


class Queue{
	// init the front and back of queue
	private $front = null;
	private $back = null; 

	public function isEmpty(){
  	// checking the queue is fill or not
		return $this->front == null;
	}


  // its for inserting data to queue
	public function enqueue($value){
		$oldBack = $this->back;
		$this->back = new Element(); 
		$this->back->value = $value;
		if($this->isEmpty()){
			$this->front = $this->back; 
		}else{
			$oldBack->next = $this->back;
		}
	}


  // for deleting data in queue
	public function dequeue(){
		if($this->isEmpty()){
			return null; 
		}
		$removedValue = $this->front->value;
		$this->front = $this->front->next;
		return $removedValue;
	}
}

// same with the stack data structure we should instance new object

$queue = new Queue();
$queue->enqueue(1);
$queue->enqueue(2);
$queue->enqueue(3);
$queue->enqueue(4);
$queue->dequeue(1); // deleting data
}

?>



<!---------------------------------------- BINARY TREE ---------------------------------------------------->

<?php

class Node {

	public $info;
	public $left;
	public $right;
	public $level;

	public function __construct($info) {
		$this->info = $info;
		$this->left = NULL;
		$this->right = NULL;
		$this->level = NULL;
	}

	public function __toString() {

		return "$this->info";
	}
}  


class SearchBinaryTree {
	public $root;
	public function  __construct() {
		$this->root = NULL;
	}
	public function create($info) {
		if($this->root == NULL) {
			$this->root = new Node($info);

		} else {
			$current = $this->root;
			while(true) {
				if($info < $current->info) {
					if($current->left) {
						$current = $current->left;
					} else {
						$current->left = new Node($info);
						break; 
					}
				} else if($info > $current->info){
					if($current->right) {
						$current = $current->right;
					} else {
						$current->right = new Node($info);
						break; 
					}
				} else {
					break;
				}
			}
		}
	}

	public function traverse($method) {
		switch($method) {
			case 'inorder':
			$this->_inorder($this->root);
			break;

			case 'postorder':
			$this->_postorder($this->root);
			break;

			case 'preorder':
			$this->_preorder($this->root);
			break;

			default:
			break;
		} 

	} 

	private function _inorder($node) {
		if($node->left) {
			$this->_inorder($node->left); 
		} 
		echo $node. " ";
		if($node->right) {
			$this->_inorder($node->right); 
		} 
	}


	private function _preorder($node) {
		echo $node. " ";
		if($node->left) {
			$this->_preorder($node->left); 
		} 
		if($node->right) {
			$this->_preorder($node->right); 
		} 
	}


	private function _postorder($node) {
		if($node->left) {
			$this->_postorder($node->left); 
		} 
		if($node->right) {
			$this->_postorder($node->right); 
		} 

		echo $node. " ";
	}


	public function BFT() {

		$node = $this->root;

		$node->level = 1; 

		$queue = array($node);

		$out = array("<br/>");


		$current_level = $node->level;


		while(count($queue) > 0) {

			$current_node = array_shift($queue);

			if($current_node->level > $current_level) {
				$current_level++;
				array_push($out,"<br/>");  
			} 

			array_push($out,$current_node->info. " ");

			if($current_node->left) {
				$current_node->left->level = $current_level + 1;
				array_push($queue,$current_node->left); 
			}    

			if($current_node->right) {
				$current_node->right->level = $current_level + 1;
				array_push($queue,$current_node->right); 
			}    
		}


		return join($out,""); 
	}
} 
$arr = array(8,3,1,6,4,7,10,14,13);

// INSERTIG DATA TO BINARY TREE
$tree = new SearchBinaryTree();
for($i=0,$n=count($arr);$i<$n;$i++) {
	$tree->create($arr[$i]);
}


?>