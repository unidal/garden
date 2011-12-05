package com.dianping.garden.page.query;

public enum Action implements com.site.web.mvc.Action {
   MAIN("main"),

   ;

   private String m_name;

   public static Action getByName(String name, Action defaultAction) {
      for (Action action : Action.values()) {
         if (action.getName().equals(name)) {
            return action;
         }
      }

      return defaultAction;
   }

   private Action(String name) {
      m_name = name;
   }

   @Override
   public String getName() {
      return m_name;
   }

   public boolean isMain() {
      return this == MAIN;
   }
}