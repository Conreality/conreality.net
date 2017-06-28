/* This is free and unencumbered software released into the public domain. */

using System;

namespace Conreality {

  /// <summary>Conreality message.</summary>
  public class Message {
    /// <summary>The message's ID.</summary>
    protected Int64 id;

    /// <summary>Constructor.</summary>
    public Message(Int64 id) {
      this.id = id;
    }

    /// <summary></summary>
    public Int64 GetID() {
      return this.id;
    }
  }
}
