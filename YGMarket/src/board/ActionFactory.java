package board;

public class ActionFactory {
	private static final ActionFactory instance = new ActionFactory();
	private ActionFactory() { }
	static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		//board
		if(command.equals("board_list")) {
			action = new B_ListAction();
		} else if(command.equals("board_content")) {
			action = new B_ContentAction();
		} else if(command.equals("board_insert")) {
			action = new B_InsertAction();
		} else if(command.equals("board_update")) {
			action = new B_UpdateAction();
		} else if(command.equals("board_updatewrite")) {
			action = new B_UpdateWriteAction();
		} else if(command.equals("board_delete")) {
			action = new B_DeleteAction();
		} else if(command.equals("board_comment")) {
			action = new B_CommentWriteAction();
		}
		
		//member
		else if(command.equals("member_join")) {
			action = new M_JoinAction();
		} else if(command.equals("member_login")) {
			action = new M_LoginAction();
		} else if(command.equals("Admin_login")) {
			action = new AdminLoginAction();
		} else if(command.equals("member_select")) {
			action = new M_SelectAction();
		} else if(command.equals("member_logout")) {
			action = new M_LogoutAction();
		} else if(command.equals("MemberIdCheck")) {
			action = new M_IdCheckAction();
		} else if(command.equals("member_findId")) {
			action = new M_FindIdAction();
		} else if(command.equals("member_findPw")) {
			action = new M_FindPwAction();
		}
		
		//product
		else if(command.equals("product_list")) {
			action = new P_ListAction();
		} else if(command.equals("product_select")) {
			action = new P_SelectAction();
		} else if(command.equals("addToCart")) {
			action = new P_AddToCartAction();
		} else if(command.equals("product_mycart")) {
			action = new P_MyCartAction();
		} else if(command.equals("order_update")) {
			action = new P_UpdateOrderAction();
		} else if(command.equals("order_delete")) {
			action = new P_DeleteOrder();
		}
		
		return action;
	}
}
